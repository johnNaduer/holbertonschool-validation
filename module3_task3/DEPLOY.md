# Deployment Guide

This document provides instructions for deploying the application using
the provided `awesome-website.zip` archive.

## Unarchiving the ZIP File

The `awesome-website.zip` archive contains the `awesome-api` binary and
the `dist/` directory. To unarchive the ZIP file, use the following
command:

``
unzip awesome-website.zip
``

## Starting and Stopping the Application

To start the application, run the following command:

``
./awesome-api
``

To stop the application, find the process ID and use the `kill` command:

``
ps aux | grep awesome-api kill [process_id]
``

## Customizing Log Locations

To customize where the application logs are written, set the `LOG_PATH`
environment variable before starting the application:

``
export LOG_PATH=/path/to/log/file ./awesome-api
``

## Healthcheck

To quickly verify that the application is running, use the following
`curl` command:

``
curl http://localhost:8080/healthcheck
``

If the application is running, it will return a `200 OK` status.

## Release

The release have tag and includes the `awesome-website.zip` file, which contains the latest version of the website.

