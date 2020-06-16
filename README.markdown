# FROST Wrapper

A Docker-based wrapper for FROST that adds additional database constraints. This prevents the creation of duplicate Observation entities with the same result time for the same Datastream entity.

## USAGE

Install Docker and Docker Compose on your target machine. Deploy this repo using Git or by downloading an archived version.

```
$ git clone https://github.com/GeoSensorWebLab/FROST-wrapper
$ cd FROST-wrapper
```

Modify the `docker-compose.yaml` file for your environment, then bring up the services while building the local image:

```
$ docker-compose up --build
```

A small Bash script will use `wget` to hit the FROST Server main URL repeatedly until it responds. This forces FROST to automatically update its database schema. After this is ready, then `psql` will alter the `OBSERVATIONS` table to add a constraint for `DATASTREAM_ID` and `RESULT_TIME`.

FROST Server is now ready to use, and will reject any request to create an Observation entity if one already exists in the database that has the same Datastream and Result Time. Clients will receive a 500 error from FROST.

## LICENSE

LGPL-3.0
