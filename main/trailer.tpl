{config_load file="static.tour.conf" scope="global"}
{** Code that overwrites the image folder if language is selected **}
{assign var="image_folder" value=#imagedir#}
{if isset($root.page.languages_attr[0].id)}
 {assign var="languageid" value=$root.page.languages_attr[0].id}
 {foreach from=$root.page.languages.language item=language}
 {if ($language.Id[0] == $languageid) && ($language.ImageFolder[0] != "")}
 {assign var="image_folder" value=$language.ImageFolder[0]}
 {/if}
 {/foreach}
{/if}
{global put="image_folder" value=$image_folder}
{include file="$tourname/trailer1.tpl"}
