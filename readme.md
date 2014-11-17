# Stylus Boilerplate

Stylus Boilerplate is a no-bullshit UI framework that is built for performance and compatibility.

It's meant for  designers and developers who care about the [bloat modern front-end frameworks like Bootstrap and Foundation are  introducing](http://yycjs.com/not-bootstrap/), and aims to solve these issues with a simplistic,
modular approach.

Similar to [organic CSS](https://github.com/krasimir/organic-css), this project uses placeholders wherever possible, so as to reduce duplicate code.  As a result, your css parses **slightly** faster, and you have to maintain less code.


## Quick start

Choose one of the following options:

1. (NPM) Install using [npm](https://www.npmjs.org/") - `npm install stylus-boilerplate --save-dev`
2. Clone the git repo — `git clone https://github.com/srsgores/Stylus-boilerplate-boilerplate.git` - and checkout the [taggedrelease](https://github.com/srsgores/Stylus-boilerplate/releases) you'd like to use.

Then bring in the styles to your project:

```
@require "../node_modules/stylus-boilerplate/app/styles/*"
```

## Overview

Everything uses ``@extend``, or at least anything you use a lot.  For example:

```
.myDiv
	@extend $inline-block // results in: display: inline-block
	@extend $small-margin-top // results in margin-top: $marginSmall
```

Then, if you add the same thing to another selector, it gets grouped (that's what ``@extend`` does:

```
.somethingElse
	@extend $inline-block
```

So you get something like:

```
.myDiv, .somethingElse {
	display: inline-block
}
```

## Components

*Stylus Boilerplate* currently ships with some starting components to get you started.  Unlike SASS boilerplate, this time I made sure to keep components more loosely coupled.  Now components are only dependent on ``helpers/index.styl``, and variables are encapsulated within each component.

The following components are included:

* Callouts (speech bubbles)
* Dropdown (menu)
* Forms
* Grid
* Icons (icomoon)
* Navigation
* Tables
* Typography

You can easily bring in one component, or simply a subset, by either using stylus' file globbing, or using ``@require`` as you require:

```
// just import callouts
@require "../bower_components/stylus-boilerplate/helpers/index" // helpers is required first
@require "../bower_components/stylus-boilerplate/components/callouts"
```

## Grid

The grid, adapted from Kouto, uses placeholders to group your "gridded" items:

```
.article--wrapper
	@extend $row // extend the parent row to later insert grid items
article
	&[role="main"]
		@extend $col-8 // takes 2 / 3, assuming $columns is 12
		& + aside
			@extend $col-4 // assuming $columns is 12, this is 1 / 3
```

## Animations

Animations have been added to allow easy-to-use animations.  Only the ``$fadeIn`` animation is included by default.  It's super simple to bring them in; simply choose the animation, located in the ``components/animations`` folder, and use file globbing:

```
@import "components/animations/fading_entrances/*"``

.myAnimatedDiv 
	@extend $fadeIn
```

Here is a list of all the animations.  Animation names are simply *camelized*:

* attention_seekers
	* ``bounce``
	* ``flash``
	* ``pulse``
	* ``rubberBand``
	* ``shake``
	* ``swing``
	* ``tada``
	* ``wobble``
* bling
	* ``puffIn``
	* ``puffOut``
	* ``vanishIn``
	* ``vanishOut``
* bomb
	* ``bombLeftOut``
	* ``bombRightOut``
* bouncing_entrances
	``bounceIn``
	``bounceInDown``
	``bounceInLeft``
	``bounceInRight``
	``bounceInUp``
* bouncing_exits
	``bounceOut``
	``bounceOutDown``
	``bounceOutLeft``
	``bounceOutRight``
	``bounceOutUp``
* fading_entrances
	``fadeIn``
	``fadeInDown``
	``fadeInDownBig``
	``fadeInLeft``
	``fadeInLeftBig``
	``fadeInRight``
	``fadeInRightBig``
	``fadeInUp``
	``fadeInUpBig``
* fading_exits
	``fadeOut``
	``fadeOutDown``
	``fadeOutDownBig``
	``fadeOutLeft``
	``fadeOutLeftBig``
	``fadeOutRight``
	``fadeOutRightBig``
	``fadeOutUp``
	``fadeOutUpBig``
* flippers
	``flip``
	``flipInX``
	``flipInY``
	``flipOutX``
	``flipOutY``
* lightspeed
	* ``lightSpeedIn``
	* ``lightSpeedOut``
* magic_effects
	* ``magic``
	* ``swap``
	* ``twisterInDown``
	* ``twisterInUp``
* math
	* ``foolishIn``
	* ``foolishOut``
	* ``holeOut``
	* ``swashIn``
	* ``swashOut``
* perspective
	* ``perspectiveDown``
	* ``perspectiveDownReturn``
	* ``perspectiveLeft``
	* ``perspectiveLeftReturn``
	* ``perspectiveRight``
	* ``perspectiveRightReturn``
	* ``perspectiveUp``
	* ``perspectiveUpReturn``
* rotate
	* ``rotateDown``
	* ``rotateLeft``
	* ``rotateRight``
	* ``rotateUp``
* rotating_entrances
	* ``rotateIn``
	* ``rotateInDownLeft``
	* ``rotateInDownRight``
	* ``rotateInUpLeft``
	* ``rotateInUpRight``
* rotating_exits
	* ``rotateOut``
	* ``rotateOutDownLeft``
	* ``rotateOutDownRight``
	* ``rotateOutUpLeft``
	* ``rotateOutUpRight``
* sliders
	* ``slideDown``
	* ``slideDownReturn``
	* ``slideInDown``
	* ``slideInLeft``
	* ``slideInRight``
	* ``slideInUp``
	* ``slideLeft``
	* ``slideLeftReturn``
	* ``slideOutDown``
	* ``slideOutLeft``
	* ``slideOutRight``
	* ``slideOutUp``
	* ``slideRight``
	* ``slideRightReturn``
	* ``slideUp``
	* ``slideUpReturn``
* specials
	* ``hinge``
	* ``rollIn``
	* ``rollOut``
* static_effects
	* ``openDownLeft``
	* ``openDownLeftOut``
	* ``openDownLeftReturn``
	* ``openDownRight``
	* ``openDownRightOut``
	* ``openDownRightReturn``
	* ``openUpLeft``
	* ``openUpLeftOut``
	* ``openUpLeftReturn``
	* ``openUpRight``
	* ``openUpRightOut``
	* ``openUpRightReturn``
* tin
	* ``tinDownIn``
	* ``tinDownOut``
	* ``tinLeftIn``
	* ``tinLeftOut``
	* ``tinRightIn``
	* ``tinRightOut``
	* ``tinUpIn``
	* ``tinUpOut``

### Customizing Animations

If you want to customize animations, you can change any of the following variables:

* ``$animationDuration``
* ``$animationDelay``
* ``$animationTimingFunction``
* ``$animationFillMode``
* ``$animationIterations``
* ``$animationDirection``
* ``$animationPlayState``

Those animations are global and will affect all animations.  If you want to specify one of these for a specific animation, simply add on to the placeholder:

```
$fadeIn
	animation-delay 4s
```

> **By default, only the ``fadeIn`` animations are loaded**

## Features

* Stylus-ready. Use the new elements with confidence.
* Automatic vendor prefixing, with browser support configuration (all within ``helpers/kouto-config.styl``
* Designed with progressive enhancement in mind.
* Modularized component-based approach, with minimal coupling only to helpers, mixins,
and kouto.  Mix and match them as you wish
* WAI-ARIA compliant, with roles.  [Start caring about accessibility today](http://seangoresht.com/index.php/blog/item/design-for-the-blind-wai-aria-explained).
* [Icomoon](https://icomoon.io) icons included, with better, faster approach to loading icons
* CSS3-animation-ready, with many placeholder animations to choose from, adapted from Dan Eden's animate.css
* Placeholder fixes, placeholder styling
* Media query-ready, with grid system placeholders already implemented.  Just extend a ``$col-[number]``, and you're good to go.
* Useful placeholders like ``%small-margin-top``, ``%large-padding-top``, and so forth.
* Fluid, extensible grid system with working media queries via susy grid system
* Apache server caching, compression, and other configuration defaults for
  Grade-A performance.
* Cross-domain Ajax and Flash in ``crossdomain.xml``
* "Delete-key friendly." Easy to strip out parts you don't need.
* Extensive inline and accompanying documentation.


## Documentation

Take a look at the [documentation table of contents (in progress)](doc/TOC.md). This
documentation is bundled with the project, which makes it readily available for
offline reading and provides a useful starting point for any documentation you
want to write about your project.


## Contributing

Anyone and everyone is welcome to [contribute](CONTRIBUTING.md). Hundreds of
developers have helped make the Stylus Boilerplate what it is today.
