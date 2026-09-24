# jq


## Generic 

Show | Code
:-- | :--:
Keys | *Alphabetical* <br> `keys` &#124; `keys[]` <br>*Unsorted*<br> `keys_unsorted` &#124; `keys_unsorted[]` <br>**Recursive**<br> ` [ .. `&#124;` objects `&#124;` keys[]] `<br>***Unique***<br>` [ .. `&#124;` objects `&#124;` keys[]] `&#124;` unique `
Array | `to_entries[] `&#124;` select(.value `&#124;` type == "array") `&#124;` .key`<br>`" to_entries[] `&#124;` select(.value `&#124;` type == \"array\") `&#124;` .key "`
Valid | `.. `&#124;` scalars `&#124;` select(type == "string" and . != "" and . != ".")`<br>`" .. `&#124;` scalars `&#124;` select(type == \"string\" and . != \"\" and . != \".\") "`                           





---


