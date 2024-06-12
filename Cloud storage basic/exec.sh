gsutil mb gs://qwiklabs-gcp-02-86ad05ab30fd

# download to upload an object into bucket 
curl https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Ada_Lovelace_portrait.jpg/800px-Ada_Lovelace_portrait.jpg --output ada.jpg


# copy using gsutil
gsutil cp ada.jpg gs://qwiklabs-gcp-02-86ad05ab30fd



# remove file
rm ada.jpg


# Download an object from your bucket Use the gsutil cp command to download
gsutil cp -r gs://qwiklabs-gcp-02-86ad05ab30fd/ada.jpg .


# Copy an object to a folder in the bucket
gsutil cp gs://qwiklabs-gcp-02-86ad05ab30fd/ada.jpg gs://qwiklabs-gcp-02-86ad05ab30fd/image-folder/



# list content
gsutil ls gs://qwiklabs-gcp-02-86ad05ab30fd


# list detail an objects
gsutil ls -l gs://qwiklabs-gcp-02-86ad05ab30fd/ada.jpg


# make object public accessible
gsutil acl ch -u AllUsers:R gs://qwiklabs-gcp-02-86ad05ab30fd/ada.jpg


# remove access public
gsutil acl ch -d AllUsers gs://qwiklabs-gcp-02-86ad05ab30fd/ada.jpg









