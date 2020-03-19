<?php
/**
 * The template to display articles in a masonry layout.
 *
 * @package kouki
 */
?>

<article id="post-<?php the_ID(); ?>" <?php post_class( 'js-item hentry-masonry' ); ?>>

  <?php if ( has_post_thumbnail() ) : ?>
    <div class="m-0-0-1 aligncenter">
      <a href="<?php the_permalink(); ?>">
      	<?php the_post_thumbnail( 'kouki_thumb_regular' ); ?>
      </a>
      <?php echo wpautop( kouki_post_thumbnail_caption() ); ?>
		  <h2>
        <a href="<?php the_permalink(); ?>" class="no-underline"><?php the_title(); ?></a>
      </h2>
    </div>
  <?php endif; ?>

</article>