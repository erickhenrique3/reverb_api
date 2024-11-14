<?php

use App\Http\Controllers\EmojiReactionController;
use Illuminate\Support\Facades\Route;

Route::post('emoji', [EmojiReactionController::class,  'react']);
