	<span><a href="#top">TOP</a></span>
	<?php echo rss_plugin_hook("rss.plugins.footer.span",null); ?>
	<span>
		<a href="https://github.com/lasgdk/bluegrss">Bluegrss</a> <?php echo _VERSION_; ?><?php echo rss_svn_rev('.'); ?>
		<!--
		<?php echo __(' powered by ') ?> <a href="http://php.net">PHP</a>, 
		<a href="http://magpierss.sourceforge.net/">MagpieRSS</a>, 
		<a href="http://sourceforge.net/projects/kses">kses</a>,
		<a href="http://www.modernmethod.com/sajax/">SAJAX</a>
		-->
	</span>
	<span style="border-right:none">
		<?php echo __('Last Update') ?>:&nbsp;<?php echo rss_footer_last_modif(); ?>
	</span>
