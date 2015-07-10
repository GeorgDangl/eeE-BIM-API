## eeE BIM-API Model Services ##

[Level Up](../README.md)
[Overview](./README.md)

Version/Date: 2015.07.10 AET/EPM  API v0.4+ (in progress)

### IMPORTANT

It is proposed to use **name locking** between multi-model and model. That is, any model is enforced to have the same name (*model_name*) as the multi-model it is a part of. To designate bewteen the models in a multi-model, the *domain_name* has to be used as part of presentation to user.

This is a requirement for the simplified interface called "confiormance level 1" to work; when a model is uploaded, the multi-model name given in URL will imply a creation of the specified multi-model. 

### Services

Models:

* [Delete Model Service](delete_model_service.md)
* [Download Model Service](download_model_service.md)
* [List Models Service](list_model_service.md)
* [Upload Model Service](upload_model_service.md)




