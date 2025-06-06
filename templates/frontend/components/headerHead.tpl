{**
 * templates/frontend/components/headerHead.tpl
 *
 * Copyright (c) 2021 Madi Nuralin
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Common site header <head> tag and contents.
 *}
<head>
	<meta charset="{$defaultCharset|escape}">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       {if isset($article)}
               {assign var="pub" value=$article->getCurrentPublication()}
               {assign var="metaDesc" value=$pub->getLocalizedData('abstract')|strip_tags|truncate:160}
               <meta name="description" content="{$metaDesc|escape}">
               {if $pub->getLocalizedData('keywords')}
                       {assign var="metaKeywords" value=','|implode:$pub->getLocalizedData('keywords')}
                       <meta name="keywords" content="{$metaKeywords|escape}">
               {/if}
               <link rel="canonical" href="{url page="article" op="view" path=$article->getBestId()}">
               <meta property="og:title" content="{$article->getLocalizedTitle()|escape}">
               <meta property="og:description" content="{$metaDesc|escape}">
               <meta property="og:url" content="{url page="article" op="view" path=$article->getBestId()}">
               {if $pub->getLocalizedCoverImageUrl()}
                       <meta property="og:image" content="{$pub->getLocalizedCoverImageUrl()|escape}">
               {/if}
               <meta name="citation_title" content="{$article->getLocalizedTitle()|escape}">
               {foreach from=$article->getAuthors() item=a}
                       <meta name="citation_author" content="{$a->getFullName()|escape}">
               {/foreach}
               {if $article->getStoredPubId('doi')}
                       <meta name="citation_doi" content="{$article->getStoredPubId('doi')|escape}">
               {/if}
               {if $pub->getData('datePublished')}
                       <meta name="citation_publication_date" content="{$pub->getData('datePublished')|date_format:'%Y/%m/%d'}">
               {/if}
               <script type="application/ld+json">
               {
                       "@context": "https://schema.org",
                       "@type": "ScholarlyArticle",
                       "headline": "{$article->getLocalizedTitle()|escape}",
                       "url": "{url page="article" op="view" path=$article->getBestId()}",
                       "datePublished": "{$pub->getData('datePublished')}",
                       "description": "{$metaDesc|escape}",
                       "author": [{foreach from=$article->getAuthors() item=a name=au}{"@type":"Person","name":"{$a->getFullName()|escape}"}{if !$smarty.foreach.au.last},{/if}{/foreach}]
               }
               </script>
       {else}
               {assign var="metaDesc" value=$currentContext->getLocalizedDescription()|strip_tags|truncate:160}
               <meta name="description" content="{$metaDesc|escape}">
               <link rel="canonical" href="{url page=$requestedPage op=$requestedOp path=$requestedArgs}">
               <meta property="og:title" content="{$pageTitleTranslated|strip_tags|escape}">
               <meta property="og:description" content="{$metaDesc|escape}">
               <meta property="og:url" content="{url page=$requestedPage op=$requestedOp path=$requestedArgs}">
       {/if}
	<title>
		{$pageTitleTranslated|strip_tags}
		{* Add the journal name to the end of page titles *}
		{if $requestedPage|escape|default:"index" != 'index' && $currentContext && $currentContext->getLocalizedName()}
			| {$currentContext->getLocalizedName()}
		{/if}
	</title>

	{load_header context="frontend"}
	{load_stylesheet context="frontend"}

</head>
