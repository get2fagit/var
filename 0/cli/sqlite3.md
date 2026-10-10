# sqlite3

### Get Tabels
`sqlite3 "$file" .tables`

### Read Browser History

##### Blink


<details><summary> .tables </summary>


```
cluster_keywords          downloads                 segment_usage
cluster_visit_duplicates  downloads_slices          segments
clusters                  downloads_url_chains      urls
clusters_and_visits       history_sync_metadata     visit_source
content_annotations       keyword_search_terms      visited_links
context_annotations       meta                      visits
```

</details>

`sqlite3 "history" "SELECT * FROM urls;"`  

                 
##### Gecko

<details><summary> .tables </summary>

  
```
moz_anno_attributes                 moz_newtab_shortcuts_interaction
moz_annos                           moz_newtab_story_click
moz_bookmarks                       moz_newtab_story_impression
moz_bookmarks_deleted               moz_origins
moz_historyvisits                   moz_places
moz_historyvisits_extra             moz_places_extra
moz_inputhistory                    moz_places_metadata
moz_items_annos                     moz_places_metadata_search_queries
moz_keywords                        moz_previews_tombstones
moz_meta
```
</details>

`sqlite3 "places.sqlite" "SELECT * FROM moz_places;"`                      
 
