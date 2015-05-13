# eeE Execute Query Service #

* [Level Up](../README.md)
* [Overview](./README.md)

** for now only placeholder for To-BE implementation spec

## Execute Query Parameters

** NOTE: only illustrative yet **

I/O/opt	| Parameter | Type | Comment |
--------|-----------|------|---------|
In  	|model_guid	|String| Model unique identification
In  (A1)|user_file|URL	| ()optional) URL to temporary file on server that can be filled from query 
-|-|-|-|-				
Out |query_result|URL	| 	A1) URL to temporary file on server that contains query result 
Out (A1)|user_file|URL	| 	A1) URL to temporary file on server that contains user output

