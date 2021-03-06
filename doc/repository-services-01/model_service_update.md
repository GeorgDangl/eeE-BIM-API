## Update Model - eeE BIM-API Model Services

* [Model Services Overview](./model_service.md)

Version: 0.4 2015.08.25 AET


**Resource URLs** 

(1): *PUT {path-to-service}/{version}/projects/**project_id**/domains/**domain_id**/models/**model_id***

(2): *PUT {path-to-service}/{version}/models/**model_id***

element | explanation
--------|-----------|
*path-to-service*	|URL pointing to an instance of eeEmbedded Repository Services|
*version*	|States version of the API to use, allowing multiple versions of API for upgrading.
*project_id*	|Identifies which project to look for model in 
*domain_id*	|Identifies which assiged domain to check for model 
*model_id**	| Identifies which model to delete


** NOTE: **

As indicated, one or more of the URL elements can be omitted. If they are present, the server will check that the model really is placed where indicated. Whether this is a useful security measure or not is left to the API user to decide.

Response: List containing single element {model_url,{[model_meta_data](./a_schemata/model_meta_data.md)}} for the updated model

** Fields that can be changed **:

*This list has to be considered...probably little of this works.*

field|comment
---|--
*description* | Freely updateable
*domain_id* | The model will be reassigned to an **existing** domain in same project. 
*domain_name* | If  domain autocreate is enabled, the model will be assigned to a **new** domain in same project. If domain name exists, the model will be reassigned to found domain in stead.
*model_name* | If **name locking** is used, the name cannot be changed. If not, it is freely updateable
*model_type* | If model is stored as **file/blob** this field is freely updateable. If the model is stored according to an implemented database schema like IFC or similar, the type cannot be changed
*schema_url*| Freely updateable

Other fields cannot be updated. Some error conditions:

* If the update results in duplicate domain models, an error is thrown.
* It is not possible to assign model to another project with this service.

**Example :**



```
PUT https://example.com/eee/bim-api/0.4/models/ABCD2233
Request:
{
	"description": "Alternative 2 data HVAC solution of Use Case 1 (new excel fmt)",
	"schema_url":"http://example.com/ms-office-excel-2013.xsd"
 }

Response:
[{
    "model_url" : "https://example.com/eee/bim-api/0.4/models/ABCD2233",
    "model_meta_data ":
    {
	"project_id": "DABB",
	"project_name": "oslo-office",
	"domain_id": "fcfc",
	"domain_name": "HVAC",
	"model_guid": "ABCD2233",
	"model_name": "HVAC_alt2_attributes",
	"model_type": "XLS",
	"model_version": "V33",
	"description": "Alternative 2 data HVAC solution of Use Case 1 (new excel fmt)",
	"schema_url":"http://example.com/ms-office-excel-2013.xsd"
 }]
```
