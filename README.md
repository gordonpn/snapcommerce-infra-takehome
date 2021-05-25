# Snapcommerce Infra Co-op Takehome Challenge

[![Build Status](https://drone.gordon-pn.com/api/badges/gordonpn/snapcommerce-infra-takehome/status.svg)](https://drone.gordon-pn.com/gordonpn/snapcommerce-infra-takehome)

## Submission details

Submitted by Gordon Pham-Nguyen.

URL of the hosted application: <https://snapcommerce.gordon-pn.com>.

### Technologies & platforms used

[Drone CI](https://www.drone.io/) is used as the CI/CD platform. The `RAILS_ENV` is set in the `deploy` pipeline as an environment variable. These configurations can be found in `.drone.yml`. Drone CI is the platform of choice for 2 main reasons: each build step is isolated in a Docker container chosen by the developers and the project is open source.

[Docker Swarm](https://docs.docker.com/engine/swarm/) is the orchestrator of choice due to its simplicity and is complementary to Docker (and Docker Compose). It helps with deploying applications to production. These configurations can be found in `docker-compose.prod.yml`.

[Traefik](https://traefik.io/traefik/) is used as the first-contact proxy and provides SSL as well as other features. Traefik takes care of automatic certificate generation as well as automatic renewals. Traefik is the proxy of choice largely because of its rich feature set, ever improving technology and integration compatibility with other technologies.

[Docker Compose](https://docs.docker.com/compose/) used for local development as it is the defacto tool for setting up containers for local development in a multi-service project. These configurations can be found in the `docker-compose.yml`.

[Cloudflare](https://www.cloudflare.com/) is the DNS manager of choice as it is time-tested and reliable. It allows managing canonical name records for subdomains.

### Bonus objectives

- The application is automatically tested and deployed when code is pushed. In the scope of this take-home, any code pushed will trigger the pipeline. Each push to the repository triggers the pipeline that consists of 3 stages: test, build & publish of the Docker image, and finally deployment using Docker Swarm. The CI pipeline will halt if the tests aren't successful. In reality, commit hashes would be used to identify the images and only deploy to production after it passes the staging environment. These configurations can be found in `.drone.yml`.
- Zero downtime upgrades are achieved through orchestration with Docker Swarm. Docker Swarm provides rolling updates/blue-green deployment of containers if they have changed. These configurations can be found in the `docker-compose.prod.yml` file under the `deploy` key.
- The application can be scaled out (horizontally) by increasing the number of replicas of the service. With other orchestrators, this can be done automatically but with Docker Swarm it must be done manually using `docker service scale <SERVICE-ID>=<NUMBER-OF-TASKS>`. The Docker Swarm routing mesh acts as a load balancer.
- SSL is achieved with [Traefik and Let's Encrypt](https://doc.traefik.io/traefik/https/acme/) and the configuration is documented [here](https://github.com/gordonpn/server-services-configs/tree/master/traefik) and in `docker-compose.prod.yml` under the `labels` key. Traefik stands in front of the application and all traffic must pass through Traefik before reaching any other service.
- Local Docker development is available through the configurations defined in `docker-compose.yml`. The project directory is mounted into the container to allow developers to modify the code directly in the container and see the changes at <http://127.0.0.1:5000>.
- Extra: the Docker images are built for both amd64 as well as arm64. arm64 architecture is generally more cost-efficient and energy-efficient.
