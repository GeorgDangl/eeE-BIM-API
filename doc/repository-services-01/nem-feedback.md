## Eduard(NEM) feedback on D4.4 version 0.42 ##
i all, sorry for the a bit later reaction (hopefully since June a will have a more time allocated for EU projects). Just some remarks to the Arne's proposal:
Concerning the model handling general (upload, download etc.) - the proposal is generally like e.g.  to GET a model :
 
`    GET /eee-repos/{version}/{repository_name}/models`	

I would strongly recommend to make versioning on the server side. If the client should handle it this will be a serious problem for all.  Means I would omit it into URL as obligatory parameter and make it e.g. like following
 
`    GET /eee-repos//{repository_name}/model/model_id?revision=3` 
 
Concerning Attachments  general:
I would recommend to handle it by extra Attachment services and not to mixed inside other different services. This means if proposal for e.g. Model download is like 
	GET /eee-repos/{version}/{repository_name}/models/{model_guid} 
the response could be like in the proposal
 
'
{ 
  "guid ": "CFCA23AA59BEEE444222CC", 
  "project_name ": "munchen-parkhaus", 
  "model_name ": "HVAC_alt_1", 
  "model_type ": "IFC4", 
  "description ": "Alternative 1 for the HVAC solution of Use Case 1", 
  "domain_name": "HVAC", 
}
' 

but extended about :
"ifcFile" :"/bimplus-gmbh/divisions/e45412f8-cd22-4c7e-a5f8-410de55824e2/download",
 "id"      :"e45412f8-cd22-4c7e-a5f8-410de55824e2"  

  means 
{ 
   "guid ": "CFCA23AA59BEEE444222CC", 
   "project_name ": "munchen-parkhaus", 
   "model_name ": "HVAC_alt_1", 
   "model_type ": "IFC4", 
   "description ": "Alternative 1 for the HVAC solution of Use Case 1", 
   "domain_name": "HVAC", 
   "ifcFile": "/bimplus-gmbh/divisions/e45412f8-cd22-4c7e-a5f8-410de55824e2/download", 
   "id": "e45412f8-cd22-4c7e-a5f8-410de55824e2" 
} 

and than if needed Attachments could be handle by special services like 

GET /eee-repos/{version}/{repository_name}/attachments/<attachment_id>  

This will be much more cleaner solution and will offer a wide range of scalability and adaptability like to mix it into different services using attachments. 

BTW - where and how will be Attachments technically stored ? (Amazon S3, some RIak instance, NAS server etc. ??) 
 
