#!/bin/bash
# Deletes all images in Azure ACR, EXCEPT the most recent image.

# Azure Container registry name
ACR_NAME=xxxxxx

# Image repository name
IMAGE_NAME=xxxxxxxxxxxx

# Get the latest image tag
LATEST_TAG=$(az acr repository show-tags --name $ACR_NAME --repository $IMAGE_NAME --orderby time_desc --top 1 --output tsv)

# Get all other image tags
OLD_TAGS=$(az acr repository show-tags --name $ACR_NAME --repository $IMAGE_NAME --orderby time_desc --output tsv | grep -v $LATEST_TAG)

#  Delete the old images
for TAG in $OLD_TAGS
do
    az acr repository delete --name $ACR_NAME --image $IMAGE_NAME:$TAG --yes
done

echo "The old images have been deleted successfully."
