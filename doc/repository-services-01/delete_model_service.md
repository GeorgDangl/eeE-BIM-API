# eeE Delete Model Service #

* [Level Up](../README.md)
* [Overview](./README.md)

**Delete a single model .**

## Delete Model Parameters

Dependent on access method, GUID or URL is used. If URL is used, GUID is part of URL

I/O/opt	| Parameter | Type | Comment |
--------|-----------|------|---------|
In  	|model_guid	|String	| Model unique identifier 
In  	|model_url	|String	| URL to model data
-|-|-|-|-				
Out  	|model_meta_data	|[model_meta_data](./a_schemata/model_meta_data.md)	| Model meta data for the deleted model


##REST/JSON interface

For consistency, repository_name is given in the resource URL. 

 | |
 --|--|
**Resource URL** 	|*DELETE /eee-repos/{version}/{repository_name}/models/{model_guid}*
*eee-repos*			|Shorthand for eeEmbedded Repository Services
*version*			|States version of the API to use, allowing multiple versions of API for upgrading.
*repository_name*	|States which server repository to use. If not given, the default repository will be used. If the repository does not exist, an error will be raised.
*model_guid*		|identifies the model


JSON Schema not available (trivial)

##REST/JSON Example

This example uses default repository by not supplying one
```

DELETE https://example.com/eee-repos/0.2/models/ABCD2233

Request:
	n.a

Response:
{
    "model_meta_data ":
    {
        "model_guid ": " ABCD2233",
	    "project_name ": "munchen-parkhaus",
	    "model_name ": "HVAC_alt2_attributes",
	    "model_type ": "XLS",
	    "model_version ": "V33",
	    "description ": "Alternative 2 data HVAC solution of Use Case 1",
	    "domain_name": "HVAC",
    }
}


```
