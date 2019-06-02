<?php
/* This example uses Wasabi because so do I */
/* See the upstream documentation for details */
$CONFIG=array(
  'objectstore' => array(
    'class' => '\\OC\\Files\\ObjectStore\\S3',
    'arguments' => array(
      'bucket' => 'nextcloud-buckets-rock',
      'autocreate' => false,
      'key'    => 'SHH123KEYSGOHERE',
      'secret' => 'MYSECRETISTHATIMALLAMA',
      'hostname' => 's3.wasabisys.com',
      'use_ssl' => true,
      'region' => 'us-east-1',
      // required for some non Amazon S3 implementations
      'use_path_style' => false
      ),
    ),
  );
