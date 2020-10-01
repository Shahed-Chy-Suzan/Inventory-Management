<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    protected $fillable = [
        'name', 'email', 'phone','address', 'photo', 'nid', 'salary', 'joining_date'
    ];
}
