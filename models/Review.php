<?php

class review extends BaseModel
{
    public function homepageReviews()
    {
        return $this->get('SELECT `customer`,`cover_img`,`avatar_img`, `content`, `rating`, `verified` FROM `reviews` ORDER BY `customer` ASC LIMIT 3;');
    }
}