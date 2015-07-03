# eeE List Models Service #

* [Level Up](../README.md)
* [Overview](./README.md)

**Retrieve a collection of model descriptions where the currently logged on user has read access.**

## List Model Parameters

**TODO: filtering using meta data**


I/O/opt	| Parameter | Type | Comment |
--------|-----------|------|---------|
In  	|model_meta_data	|[model_meta_data](./a_schemata/model_meta_data.md)	| Model meta data for filtering, see below for mandatory fields
-|-|-|-|-				
Out 	|Model URL 			|String			|URL to the model data on the target server 
Out 	|Model Meta Data 	|[model_meta_data](./a_schemata/model_meta_data.md)	|Full model meta data as stored on the server.



##REST/JSON interface

repository_name is given in the resource URL

Element | Content|
--------|--------|
**Resource URL** 	|*GET /eee-repos/{version}/{repository_name}/models*
*eee-repos*			|Shorthand for eeEmbedded Repository Services
*version*			|States version of the API to use, allowing multiple versions of API for upgrading.
*repository_id*	    |States which server repository to use. If not given, the default repository will be used. If the repository does not exist, an error will be raised.

JSON Schema not available (trivial)

##REST/JSON Example

This example shows two versions of one model and one version of another
```
GET https://example.com/eee-repos/0.3/rep1/models

Request:
	n.a

Response:
[{
    "model_url ": "http://example.com/eee-repos/0.3/models/CFCA23AA59BEEE444222CC",
    "model_meta_data ":
    {
        "model_guid ": "CFCA23AA59BEEE444222CC",
	    "project_name ": "munchen-parkhaus",
	    "model_name ": "HVAC_alt_1",
	    "model_type ": "IFC4",
	    "model_version ": "V1",
	    "description ": "Alternative 1 for the HVAC solution of Use Case 1",
	    "domain_name": "HVAC",
    }
},
{
    "model_url ": "http://example.com/eee-repos/0.3/models/CFCA23AA59BEEE444FFFFF",
    "model_meta_data ":
    {
        "model_guid ": "CFCA23AA59BEEE444FFFFF",
	    "project_name ": "munchen-parkhaus",
	    "model_name ": "HVAC_alt_1",
	    "model_type ": "IFC4",
	    "model_version ": "V2",
	    "description ": "Alternative 1 for the HVAC solution of Use Case 1",
	    "domain_name": "HVAC",
    }
},
[{
    "model_url ": "http://example.com/eee-repos/0.3/models/ADFE23AA11BCFF444122BB",
    "model_meta_data ":
    {
        "model_guid ": "ADFE23AA11BCFF444122BB",
	    "project_name ": "munchen-parkhaus",
	    "model_name ": "HVAC_alt_2",
	    "model_type ": "IFC4",
	    "model_version ": "V1",
	    "description ": "Alternative 2 for the HVAC solution of Use Case 1",
	    "domain_name": "HVAC",
    }
}]
```
