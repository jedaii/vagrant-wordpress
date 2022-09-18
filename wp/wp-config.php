<?php

define( 'DB_NAME', );
define( 'DB_USER', );
define( 'DB_PASSWORD', );
define( 'DB_HOST', '192.168.56.20' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

define( 'AUTH_KEY',         'p}+:2sS 5&x*kj)&n1~:-lQ0bS}bWt_)t*O6[+m1Sk[akShEZsnEn_0)HYW%:v(-' );
define( 'SECURE_AUTH_KEY',  '97P&vd>-kS}>?C.2,Z8Q~)7#6Y2j?PvbTn9TGQ{*:}NY3EbB0g6-&~d|-:$+7|ak' );
define( 'LOGGED_IN_KEY',    'u`Ic2K8+vj rLkXy(.SuF|B?-BhSSQvET^ 1He }9OT)jroz#It.TBTPL>< E_Hm' );
define( 'NONCE_KEY',        'RA3`tykwY.;uG/F)ZuiT+nSCSnk6q(BGO?a Bd{fDx*-`2*Ibbb)rqsUS+}MK`fx' );
define( 'AUTH_SALT',        'Npj[)]DsJs+wDCSxrG:rF>rr/-C{!?c%zGm{:2CK_^uB[AvJT/MxqBT!f0P1oGb~' );
define( 'SECURE_AUTH_SALT', '7b+?o@`fD|13FwYmc}!7UN|rno~gtuXA(;pNW=+2`%W=R|i_)bQe`Q|!b&>eq=Q(' );
define( 'LOGGED_IN_SALT',   '}.W;.$d /cw>WT#NRzN3Yu;@vnfmGqZ<cBPk@0:FWk;zr%S./W3JZacUoNo~9stz' );
define( 'NONCE_SALT',       '8$DA9OO.|Vr=~}RQf%4N3!XTOiQMr,N|@Bfk-R??2rxIXuV,K|o!tq-.|?ue*(lG' );

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';