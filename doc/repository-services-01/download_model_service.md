# eeE Download Model Service #

* [Level Up](../README.md)
* [Overview](./README.md)

**Retrieve a single model as a file with model default encoding and format.**

## Download Model Parameters

Dependent on access method, GUID or URL is used. If URL is kused, GUID is part of URL

I/O/opt	| Parameter | Type | Comment |
--------|-----------|------|---------|
In  	|model_guid	|String	| Model unique identifier 
In  	|model_url	|String	| URL to model data
-|-|-|-|-				
Out 	|Model Data		|binary stream			| model data from target server 


##REST/JSON interface

For consistency, repository_name is given in the resource URL. 

 | |
 --|--|
**Resource URL** 	|*GET /eee-repos/{version}/{repository_name}/models/{model_guid}*
*eee-repos*			|Shorthand for eeEmbedded Repository Services
*version*			|States version of the API to use, allowing multiple versions of API for upgrading.
*repository_name*	|States which server repository to use. If not given, the default repository will be used. If the repository does not exist, an error will be raised.
*model_guid*		|identifies the model


JSON Schema not available (trivial)

##REST/JSON Example

This example uses default repository by not supplying one
```

GET https://example.com/eee-repos/0.2/models/ABCD2233

Request:
	n.a

Response:
	Model data as “file”


```
