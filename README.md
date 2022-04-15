## Overview

In this guide, we will take you through creating your Kubernetes (k8s) cluster and deploying an application. This guide shows how you can create a Kubernetes cluster with Amazon Elastic Kubernetes Service (EKS) and Amazon EC2 worker nodes . Throughout this guide, you will also learn how to use AWS CDK and AWS CDK8S to help you streamline the process, from creating cluster to deploying and operating your applications.

## What You Will Learn

In this guide, you will learn how to:

* Create a Kubernetes cluster with a single tenant control plane using Amazon EKS and launch managed Amazon EC2 worker nodes. 
* Implement Infrastructure-as-Code (IaC) for a Kubernetes cluster using AWS CDK.
* Integrate AWS CDK8S and AWS CDK to deploy the application.
* Operate the cluster with basic commands using kubectl.

## Prerequisites

Before Starting this guide, you will need:

* An AWS account: if you don't already have one follow the [Setup Your Environment getting started guide](https://aws.amazon.com/getting-started/guides/setup-environment/) for a quick overview.
* CDK Installed: Visit our [Setup AWS CDK](https://aws.amazon.com/getting-started/guides/setup-cdk/) getting started guide to learn more.


## Modules

This tutorial is divided into the following short modules. You must complete each module before moving to the next one.

* [Create a Cluster](https://aws.amazon.com/getting-started/guides/deploy-webapp-eks/module-one/) (10 mins): Using AWS CDK to create a Kubernetes cluster with Amazon EKS as the control plane and launch managed Amazon EC2 worker nodes.
* [Installing the AWS CDK8S CLI](https://aws.amazon.com/getting-started/guides/deploy-webapp-eks/module-two/) (5 mins)
* [Creating service and deployment](https://aws.amazon.com/getting-started/guides/deploy-webapp-eks/module-three/) (5 mins): Launch your application using AWS CDK and AWS CDK8S.
* [Deploy infrastructure with CDK](https://aws.amazon.com/getting-started/guides/deploy-webapp-eks/module-four/) (10 mins): Learn how to launch your infrastructure using CDK and deploy your application.
* [Clean Up Resources](https://aws.amazon.com/getting-started/guides/deploy-webapp-eks/module-five/)e: In this last part of the guide you learn how to clean after you are done.

Source: https://aws.amazon.com/getting-started/guides/deploy-webapp-eks/