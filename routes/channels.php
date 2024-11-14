<?php

use Illuminate\Support\Facades\Broadcast;

Broadcast::channel('emoji-reaction', function ($user, $id) {
    return true;
});
