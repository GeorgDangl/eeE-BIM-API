# eeE Download Model Service #

* [Level Up](../README.md)
* [Overview](./README.md)

**Retrieve a single model as a file with model default encoding and format.**

## Download Model Parameters

Dependent on access method, GUID or URL is used. If URL is used, GUID is part of URL

I/O/opt	| Parameter | Type | Comment |
--------|-----------|------|---------|
In  	|model_guid	|String	| Model unique identifier 
In  	|model_url	|String	| URL to model data
-|-|-|-|-				
Out 	|Model Data		|binary stream			| model data from target server 


##REST/JSON interface

For consistency, repository_id is given in the resource URL. Since the model GUID uniquely defines model, it can be omitted, if server allows it.
The model URL must in any case be used as defined by [List Models Service](list_model_service.md).

Element | Content|
--------|--------|
**Resource URL** 	|*GET /eee-repos/{version}/models/{model_guid}*
*eee-repos*			|Shorthand for eeEmbedded Repository Services
*version*			|States version of the API to use, allowing multiple versions of API for upgrading.
*model_guid*		|identifies the model


JSON Schema not available (trivial)

##REST/JSON Example

This example uses default repository by not supplying one
```

GET https://example.com/eee-repos/0.3/models/ABCD2233

Request:
	n.a

Response:
	Model data as “file”


```
