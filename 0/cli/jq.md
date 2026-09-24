# jq


## Generic 

Show | Code
:-- | :--:
Keys | *Alphabetical* <br> `keys` &#124; `keys[]` <br>*Unsorted*<br> `keys_unsorted` &#124; `keys_unsorted[]` <br>**Recursive**<br> ` [ .. `&#124;` objects `&#124;` keys[]] `<br>***Unique***<br>` [ .. `&#124;` objects `&#124;` keys[]] `&#124;` unique `
Array | `to_entries[] `&#124;` select(.value `&#124;` type == "array") `&#124;` .key`<br>`" to_entries[] `&#124;` select(.value `&#124;` type == \"array\") `&#124;` .key "`
Valid | `.. `&#124;` scalars `&#124;` select(type == "string" and . != "" and . != ".")`<br>`" .. `&#124;` scalars `&#124;` select(type == \"string\" and . != \"\" and . != \".\") "`                           





---





## Get keys
`keys` | `keys[]`                                               

##### unsorted == `keys_unsorted` | `keys_unsorted[]`                                                                                                   
###### recurse == ` [ .. | objects | keys[]] `                       
###### unique == ` [ .. | objects | keys[]] | unique `                                                                          


Show | Code
:-- | :--:
Keys | *Alphabetical* <br> `keys` &#124; `keys[]` <br>*Unsorted*<br> `keys_unsorted` &#124; `keys_unsorted[]` <br>**Recursive**<br> ` [ .. `&#124;` objects `&#124;` keys[]] `<br>***Unique***<br>` [ .. `&#124;` objects `&#124;` keys[]] `&#124;` unique `




***





Show | Code
:-- | :--:
Keys | *Alphabetical* <br> `keys` &#124; `keys[]` <br>*Unsorted*<br> `keys_unsorted` &#124; `keys_unsorted[]` <br>**Recursive**<br> ` [ .. `&#124;` objects `&#124;` keys[]] `<br>***Unique***<br>` [ .. `&#124;` objects `&#124;` keys[]] `&#124;` unique `
Array | `to_entries[] `&#124;` select(.value `&#124;` type == "array") `&#124;` .key`<br>`" to_entries[] `&#124;` select(.value `&#124;` type == \"array\") `&#124;` .key "`
Valid | `.. `&#124;` scalars `&#124;` select(type == "string" and . != "" and . != ".")`<br>`" .. `&#124;` scalars `&#124;` select(type == \"string\" and . != \"\" and . != \".\") "`                           



***

<!--
Show | Code
:-- | :--:
Keys | *Alphabetical* <br> `keys` &#124; `keys[]` <br>*Unsorted*<br> `keys_unsorted` &#124; `keys_unsorted[]` <br>**Recursive**<br> ` [ .. `&#124;` objects `&#124;` keys[]] `<br>***Unique***<br>` [ .. `&#124;` objects `&#124;` keys[]] `&#124;` unique `
Array | `to_entries[] `&#124;` select(.value `&#124;` type == "array") `&#124;` .key`<br>*escaped*<br>`" to_entries[] `&#124;` select(.value `&#124;` type == \"array\") `&#124;` .key "`

## Get arrays
 `to_entries[] | select(.value | type == "array") | .key`                                                            
 `" to_entries[] | select(.value | type == \"array\") | .key "`                           

 ## Skip null
 `.. | scalars | select(type == "string" and . != "" and . != ".")`                          
 `" .. | scalars | select(type == \"string\" and . != \"\" and . != \".\") "`                           


-->





 


<!--
Want | Code
:-- | :--:
Keys | *Aplhabetical* <br><ul><li> `keys` </li><li> `keys[]`</li></ul><br>*Unsorted*<br> `keys_unsorted` &#124; `keys_unsorted[]` <br>**Recursive**<br> ` [ .. `&#124;` objects `&#124;` keys[]] `<br>**Unique**<br>` [ .. `&#124;` objects `&#124;` keys[]] `&#124;` unique `
-->

                               

<!--
Want | Code
:-- | :--:
Keys | <ul><li> `keys` </li><li> `keys[]`</li><li> `keys_unsorted`</li><li>`keys_unsorted[]` </li></ul>*Recursive + Unique*<ul><li>` [ .. `&#124;` objects `&#124;` keys[]] `</li><li> ` [ .. `&#124;` objects `&#124;` keys[]] `&#124;` unique `</li><ul>
-->                        




                      
<!--
Want | Code
:-- | :--:
Keys | <ul><li> `keys` </li><li> `keys[]`</li><li> `keys_unsorted`</li><li>`keys_unsorted[]` </li></ul><br><br>*Recursive + Unique*<ul><li>` [ .. `&#124;` objects `&#124;` keys[]] `</li><li> ` [ .. `&#124;` objects `&#124;` keys[]] `&#124;` unique `</li><ul>
-->






<!--
HIYA
<br>**Recursive**<br> 
` [ .. `&#124;` objects `&#124;` keys[]] `<br>**Unique**<br>` [ .. `&#124;` objects `&#124;` keys[]] `&#124;` unique `
-->                                                                 

Want | Code
:-- | :--:
Keys | *Aplhabetical* <br> `keys` &#124; `keys[]` <br>*Unsorted*<br> `keys_unsorted` &#124; `keys_unsorted[]` <br>**Recursive**<br> ` [ .. `&#124;` objects `&#124;` keys[]] `<br>**Unique**<br>` [ .. `&#124;` objects `&#124;` keys[]] `&#124;` unique `







Want | Code
:-- | :--:
Keys | `keys` &#124; `keys[]` <br>*Unsorted*<br> `keys_unsorted` &#124; `keys_unsorted[]` <br>**Recursive**<br> ` [ .. `&#124;` objects `&#124;` keys[]] `<br>**Unique**<br>` [ .. `&#124;` objects `&#124;` keys[]] `&#124;` unique `
Recurse | ` [ .. `&#124;` objects `&#124;` keys[]] ` <br>**Unique**<br> ` [ .. `&#124;` objects `&#124;` keys[]] `&#124;` unique `


                     




Type | Param
 -- | --  
Sorted | `keys` | `keys[]`
Unsorted | `keys_unsorted` | `keys_unsorted[]`
Recurse | `[ .. | objects | keys[]]`
Unique | `[ .. | objects | keys[]] | unique`









## Get arrays
 `to_entries[] | select(.value | type == "array") | .key`                                                            
 `" to_entries[] | select(.value | type == \"array\") | .key "`                           

 ## Skip null
 `.. | scalars | select(type == "string" and . != "" and . != ".")`                          
 `" .. | scalars | select(type == \"string\" and . != \"\" and . != \".\") "`                           


