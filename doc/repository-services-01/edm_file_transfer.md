#EDM File Transfer 

* [Level Up](../README.md)
* [Overview](./README.md)



This second alternative for file up- or download the file size is unlimited. 
It works by buffering the file(s) in question in a temporary area on the server while transferring,
and handling the files by URL's in the actual services. 

**NOTE: this area cannot be used for persistent storage, it is a temporary storage only!**



**The UPLOAD sequence is as follows:**

1. Create temporary file on server: *createTemporaryFile*
2. Upload local file to temporary file
3. Invoke service to process the temporary file, typically [eeE Upload Model service](./upload_model_service.md)
4. Delete the temporary file


**The DOWNLOAD sequence is as follows:**

1. Create temporary file on server: *createTemporaryFile* *if necssary, some most  creates their own temp file automatically*
2. Invoke service to populate the temporary file typically [eeE Execute Query service](./execute_query_service.md)
3. Download temporary file to local file
4. Delete the temporary file


###createTemporaryFile service

The method starts by executing the following function:

    AccessControl.fileTransferInfo uploadFile = access.createTemporaryFile(sessionId, "picture-1", ".jpg", true);

The input parameters are as follows:

I/O |Parameter  | Type 	| Comment 
----|-----------|-------|---------
In	|EDMsessionId|String|	SessionId obtained by access.login(,,,);
In	|filename	|String	|	First part of the temporary file created by the function.
In	|fileType	|String	|	File extension of the temporary file created by the function.
In	|upload		|boolean| 	True if the file is going to be used for upload, false if download
----|-----------|-------|---------
Out |AccessControl.fileTransferInfo| 

AccessControl.fileTransferInfo has the following attributes: 

Parameter           | Type  | Comment 
--------------------|-------|---------
uploadOrDownloadUrl	|String	|First part of the URL for later up or download. Concatenated with the session id it will become an URL for later up or download.
progressInfoUrl		|String	|If the application wants to show up- or download progression to the user a new thread can be started and the new thread can, by this URL , get the number of  transferred to / from the file.
fileNameOnServer	|String	|Identifies the temporary file that is to be up- or downloaded
Operation			|String	|value “upload” if the file is going to be used for uploading.


###uploadFileToEDM service

To upload a local file to the temporary file created by access.createTemporaryFile you may use the following .NET routine:
```
private string uploadFileToEDM(string url, string file)
{
    HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create(url);
    httpWebRequest.Method = "POST"; httpWebRequest.KeepAlive = true;
    httpWebRequest.Credentials = System.Net.CredentialCache.DefaultCredentials;

    FileStream fileStream = new FileStream(file, FileMode.Open, FileAccess.Read);
    long fileLength = fileStream.Length;
    httpWebRequest.ContentLength = fileLength;

    Stream requestStream = httpWebRequest.GetRequestStream();
    byte[] buffer = new byte[4096];

    int bytesRead = 0;
    // Loop through whole file uploading parts in a stream.
    while ((bytesRead = fileStream.Read(buffer, 0, buffer.Length)) != 0)
    {
        requestStream.Write(buffer, 0, bytesRead);
        requestStream.Flush();
    }

    requestStream.Close(); fileStream.Close();

    WebResponse webResponse = httpWebRequest.GetResponse();
    Stream responseStream = webResponse.GetResponseStream();
    StreamReader responseReader = new StreamReader(responseStream);
    string responseString = responseReader.ReadToEnd();
    webResponse.Close();

    return responseString;
}
```

###downloadFileFromEDM service

To download a temporary file created by access.createTemporaryFile (and content filled by an EDM query function) you may use the following .NET routine:

```
private void downloadFileFromEDM(string url, string file)
{
    HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create(url);
    httpWebRequest.Method = "POST"; httpWebRequest.KeepAlive = true;
    httpWebRequest.Credentials = System.Net.CredentialCache.DefaultCredentials;

    Stream responseStream = httpWebRequest.GetResponse().GetResponseStream();
    FileStream fileStream = new FileStream(file, FileMode.OpenOrCreate, FileAccess.Write);
    byte[] buffer = new byte[4096];
    int bytesRead = 0;
    // Loop through whole file uploading parts in a stream.
    while ((bytesRead = responseStream.Read(buffer, 0, buffer.Length)) != 0)
    {
        fileStream.Write(buffer, 0, bytesRead);
        fileStream.Flush();
    }
    responseStream.Close(); fileStream.Close();
}
```

We than show the following .NET client code which creates two temporary files, 
one for uploading a file from the client and one that shall be filled with content by the EDM query function (web service operation) copyFileViaFileAttribute. 
After up and downloading, the two temporary files are deleted by the function access.deleteTemporaryFile.

```
AccessControl.fileTransferInfo uploadFile = access.createTemporaryFile(sessionId, "pic1", ".jpg", true);
AccessControl.fileTransferInfo downloadFile = access.createTemporaryFile(sessionId, "pic2", ".jpg", false);
string transfer = uploadFileToEDM(uploadFile.uploadOrDownloadUrl + sessionId, "C:\\testFiles\\IMG_2059.jpg");
myWebService s = new WebService();
int rk = s.copyFileViaFileAttribute(sessionId, uploadFile.fileNameOnServer, downloadFile.fileNameOnServer, 345);
downloadFileFromEDM(downloadFile.uploadOrDownloadUrl + sessionId, "C:\\testFiles\\downloaded_2059.jpg");

String deleteRetur = access.deleteTemporaryFile(sessionId, uploadFile);
deleteRetur = access.deleteTemporaryFile(sessionId, downloadFile);
```

###deleteTemporaryFile service


We than show the following .NET client code which creates two temporary files, 
one for uploading a file from the client and one that shall be filled with content by the EDM query function (web service operation) copyFileViaFileAttribute. 
After up and downloading, the two temporary files are deleted by the function access.deleteTemporaryFile.

```
AccessControl.fileTransferInfo uploadFile = access.createTemporaryFile(sessionId, "pic1", ".jpg", true);
AccessControl.fileTransferInfo downloadFile = access.createTemporaryFile(sessionId, "pic2", ".jpg", false);
string transfer = uploadFileToEDM(uploadFile.uploadOrDownloadUrl + sessionId, "C:\\testFiles\\IMG_2059.jpg");
myWebService s = new WebService();
int rk = s.copyFileViaFileAttribute(sessionId, uploadFile.fileNameOnServer, downloadFile.fileNameOnServer, 345);
downloadFileFromEDM(downloadFile.uploadOrDownloadUrl + sessionId, "C:\\testFiles\\downloaded_2059.jpg");

String deleteRetur = access.deleteTemporaryFile(sessionId, uploadFile);
deleteRetur = access.deleteTemporaryFile(sessionId, downloadFile);
```
