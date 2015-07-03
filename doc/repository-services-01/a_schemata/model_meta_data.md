## eeE Repository Services Schemata : Model Meta Data ##

* [Level Up](../README.md)
* [Overview](./README.md)

Here is the components so far:

## Model Meta Data

For each model the following attributes are used for model meta data, as members of a model meta data element:
 
 Attribute   | Type | Comment |
-------------|------|---------|
project_name |String|Names the project this model belongs to
model_guid	 |String|Unique identifier of the model. The guid is generated on the server, and differs between versions
model_name	 |String|Name of the model. Also used as "model id". Then name is same across versions
model_type	 |String|Type of the model (e.g. IFC2x3, IFC4, XML, CSV, ifcXML, ….) 
model_version|String|Version of the model, usually server generated in the form of V21,V2,V3,...
schema_url	 |String|URL to the model schema
description  |String|Human readable description of the model, informative only, no functional impact
domain_name  |String|Tags the model with a named discipline/domain. 

The attributes are mandatory or optional depending on the service used.


###XSD rep

###JSON rep:

```
{
"$schema": "http://json-schema.org/draft-03/schema#" 
	"title": "eee_model_meta_data",
	"description": "Schema for model meta data, eeE REST API.",
	"type": "object",
			"properties": {
				"project_name": {
					"type": ["string","null"]
				},
				"model_guid ": {
					"type": ["string","null"]
				},
				"model_name": {
					"type": ["string","null"]
				},
				"model_type ": {
					"type": ["string","null"]
				},
				"model_version ": {
					"type": ["string","null"]
				},
				"schema_url": {
					"type": ["string","null"]
				},
				"description": {
					"type": ["string","null"]
				},
				"domain_name ": {
					"type": ["string","null"]
				},
			}
	}
}
```

###EXPRESS rep:

```
	ENTITY BIM3API_model_meta_data:
		repository_name	: OPTIONAL STRING;
		model_guid 		: OPTIONAL STRING;
		model_name		: OPTIONAL STRING;
		model_type		: OPTIONAL STRING;
		model_version	: OPTIONAL STRING;
		schema_url		: OPTIONAL STRING;
		description		: OPTIONAL STRING;
		domain_name		: OPTIONAL STRING;
	END_ENTITY;
```

