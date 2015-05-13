## eeE Upload Model Service ##

[Level Up](../README.md)
[Overview](./README.md)

Here is the components so far:

### Model Meta Data

For each model the following attributes are used for model meta data, as members of a model meta data element:
 
 Attribute   | Type | Comment |
-------------|------|---------|
repository_name |String| States which server repository to use
model_guid	 |String|Unique identifier of the model. The guid is generated on the server, and differs between versions
model_name	 |String|Name of the model. Also used as "model id". Then name is same across versions
model_type	 |String|Type of the model (e.g. IFC2x3, IFC4, XML, CSV, ifcXML, ….) 
model_version|String|Version of the model, usually server generated in the form of V21,V2,V3,...
schema_url	 |String|URL to the model schema
description  |String|Human readable description of the model, informative only, no functionbal impact
domain_name  |String|Tags the model with a named displine/domain. 

The attributes are mandatory or optional depending on the service used.


XSD rep

JSON rep:

EXPRESS rep:
```
ENTITY BIM3API_modeol_meta_data:
	model_guid: STRING;
END_ENTITY;
```

