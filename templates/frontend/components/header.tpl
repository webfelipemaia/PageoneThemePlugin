{**
 * templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Site-wide header; includes journal logo, user menu, and primary menu
 * @uses $languageToggleLocales array All supported locales (from the Pageone theme)
 *}

{strip}
	{* Determine whether a logo or title string is being displayed *}
	{assign var="showingLogo" value=true}
	{if !$displayPageHeaderLogo}
		{assign var="showingLogo" value=false}
	{/if}
	{assign var="localeShow" value=false}
	{if $languageToggleLocales && $languageToggleLocales|@count > 1}
		{assign var="localeShow" value=true}
	{/if}
{/strip}

<!DOCTYPE html>

<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
<body class="page_{$requestedPage|escape|default:"index"} op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}{if $pageoneIndexType} {$pageoneIndexType|escape}{/if}"
      dir="{$currentLocaleLangDir|escape|default:"ltr"}">

<div class="cmp_skip_to_content">
	<a class="sr-only" href="#pageone_content_header">{translate key="navigation.skip.nav"}</a>
	<a class="sr-only" href="#pageone_content_main">{translate key="navigation.skip.main"}</a>
	<a class="sr-only" href="#pageone_content_footer">{translate key="navigation.skip.footer"}</a>
</div>


			{* Primary navigation *}
			{capture assign="primaryMenu"}
				{load_menu name="primary" id="navigationPrimary" ulClass="pkp_navigation_primary"}
			{/capture}

			{if !empty(trim($primaryMenu)) || $currentContext}
			<nav id="navigationStickyMenu" class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
				<div class="container-fluid">
				<a class="navbar-brand" href="#">
					<img src="{$baseUrl}/templates/images/structure/logo.png" alt="Bootstrap" width="30" height="24">
				</a>
		  
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
		  
				<div class="collapse navbar-collapse" id="main-menu">
					{$primaryMenu}
				</div>
				</div>
			</nav>
			{/if}

<header class="main-header"
        id="pageone_content_header"{if $pageoneHomepageImage} style="background-image: url('{$publicFilesDir}/{$pageoneHomepageImage.uploadName|escape:"url"}')"{/if}>
	<div class="container-fluid">
		<nav class="main-header__admin{if $localeShow} locale-enabled{else} locale-disabled{/if}">

			{* User navigation *}
			{capture assign="userMenu"}
				{load_menu name="user" id="navigationUser" ulClass="pkp_navigation_user"}
			{/capture}

			{* language toggle block *}
			{if $localeShow}
				{include file="frontend/components/languageSwitcher.tpl" id="languageNav"}
			{/if}

			{if !empty(trim($userMenu))}
				<h2 class="sr-only">{translate key="plugins.themes.pageone.adminMenu"}</h2>
				{$userMenu}
			{/if}

		</nav>

		{if $requestedOp == 'index'}
			<h1 class="main-header__title">
		{else}
			<div class="main-header__title">
		{/if}

		{capture assign="homeUrl"}
			{url page="index" router=$smarty.const.ROUTE_PAGE}
		{/capture}

		{if $displayPageHeaderLogo}
			<a href="{$homeUrl}" class="is_img">
				<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
			</a>
		{elseif $displayPageHeaderTitle}
			<a href="{$homeUrl}" class="is_text">
				<span>{$displayPageHeaderTitle|escape}</span>
			</a>
		{else}
			<a href="{$homeUrl}" class="is_img">
				<img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" width="180" height="90" />
			</a>
		{/if}

		{if $requestedOp == 'index'}
			</h1>
		{else}
			</div>
		{/if}

	</div> {* container closing tag *}
</header>
