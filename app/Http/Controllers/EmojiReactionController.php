<?php

namespace App\Http\Controllers;

use App\Events\EmojiReceived;
use Illuminate\Http\Request;

class EmojiReactionController extends Controller
{
   public function react(Request $request)
   {
    $emoji = $request->input('emoji');

    broadcast(new EmojiReceived($emoji));

    return response()->json('sucess');
   }
}
