<?php

class Employee extends BaseModel
{
    public function homepageEmployees()
    {
        return $this->get('SELECT `name` , `job`, `description`, `img` FROM `employees` ORDER BY `name` ASC LIMIT 4;');
    }
}