## Download Model - eeE BIM-API Model Services

* [Model Services Overview](./model_service.md)

Version: 0.4 2015.08.25 AET

**Resource URLs** 

(1): *GET {path-to-service}/{version}/projects/**project_id**/domains/**domain_id**/models/**model_id***

(2): *GET {path-to-service}/{version}/models/**model_id***

element | explanation
--------|-----------|
*path-to-service*	|URL pointing to an instance of eeEmbedded Repository Services|
*version*	|States version of the API to use, allowing multiple versions of API for upgrading.
*project_id*	|Identifies which project to look for model in 
*domain_id*	|Identifies which assiged domain to check for model 
*model_id*	| Identifies which model to download


** NOTE: **

As indicated, one or more of the URL elements can be omitted. If they are present, the server will check that the model really is placed where indicated. Whether this is a useful security measure or not is left to the API user to decide.

Response: Binary stream	with model data from target server 


JSON Schema not available (trivial)

##REST/JSON Example

This example uses default repository by not supplying one

```
GET https://example.com/eee/bim-api/0.4/models/ABCD2233

Response: Model data as “file”
```
