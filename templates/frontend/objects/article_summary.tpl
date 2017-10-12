{**
 * templates/frontend/objects/article_summary.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article summary which is shown within a list of articles.
 *
 * @uses $article Article The article
 * @uses $hasAccess bool Can this user access galleys for this context? The
 *       context may be an issue or an article
 * @uses $showGalleyLinks bool Show galley links to users without access?
 *}
{assign var=articlePath value=$article->getBestArticleId($currentJournal)}
{if (!$section.hideAuthor && $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_DEFAULT) || $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_SHOW}
	{assign var="showAuthor" value=true}
{/if}

<div class="article-summary media">
	{if $article->getLocalizedCoverImage()}
		<div class="cover media-left">
			<a href="{url page="article" op="view" path=$articlePath}" class="file">
				<img class="media-object" src="{$publicFilesDir|escape}/{$article->getLocalizedCoverImage()|escape}">
			</a>
		</div>
	{/if}

	<div class="media-body">
		<h3 class="media-heading">
			<a href="{url page="article" op="view" path=$articlePath}">
				{$article->getLocalizedTitle()|strip_unsafe_html}
			</a>
		</h3>

		{if $showAuthor || $article->getPages() || ($article->getDatePublished() && $showDatePublished)}

			{if $showAuthor}
				<div class="meta">
					{if $showAuthor}
						<div class="authors">
							{$article->getAuthorString()}
						</div>
					{/if}
				</div>
			{/if}

			{* Page numbers for this article *}
			{if !$hidePages && $article->getPages()}
				<p class="pages">
					{$article->getPages()|escape}
				</p>
			{/if}
			<div class="btn-group" role="group">
				{foreach from=$article->getGalleys() item=galley}
					{include file="frontend/objects/galley_link.tpl" parent=$article}
				{/foreach}
			</div>
<!--
<ul class="galleys_links">
	{foreach from=$article->getGalleys() item=galley}
		{* Skip any files that are NOT from a primary genre *}
		{if $primaryGenreIds}
			{assign var="file" value=$galley->getFile()}
			{if !$file || !in_array($file->getGenreId(), $primaryGenreIds)}
				{php}continue;{/php}
			{/if}
		{/if}
		<li>
			{include file="frontend/objects/galley_link.tpl" parent=$article hasAccess=true}
		</li>
	{/foreach}
</ul>
<ul class="galleys_links">
	{foreach from=$article->getGalleys() item=galley}
		{* Skip any files that ARE from a primary genre *}
		{if $primaryGenreIds}
			{assign var="file" value=$galley->getFile()}
			{if $file && in_array($file->getGenreId(), $primaryGenreIds)}
				{php}continue;{/php}
			{/if}
		{/if}
		<li>
sup:
			{include file="frontend/objects/galley_link.tpl" parent=$article hasAccess=true}
		</li>
	{/foreach}
</ul>
-->
			{* Article Galleys *}
			{if $primaryGalleys}
				<div class="item galleys">
					<ul class="value galleys_links">
						{foreach from=$primaryGalleys item=galley}
							<li>
								{include file="frontend/objects/galley_link.tpl" parent=$article galley=$galley}
							</li>
						{/foreach}
					</ul>
				</div>
			{/if}
			{if $supplementaryGalleys}
				<div class="item galleys">
					<ul class="value supplementary_galleys_links">
						{foreach from=$supplementaryGalleys item=galley}
							<li>
								{include file="frontend/objects/galley_link.tpl" parent=$article galley=$galley isSupplementary="1"}
							</li>
						{/foreach}
					</ul>
				</div>
			{/if}
		{/if}
	</div>

	{call_hook name="Templates::Issue::Issue::Article"}
</div><!-- .article-summary -->
