<?php
class Pagination
{
    const SKIN_DEFAULT = 'pagination';
    const SKIN_NOSTYLE = 'pagination-nostyle';

    public $total = 0;
    public $page = 1;
    public $limit = 20;
    public $num_links = 3;
    public $url = '';
    public $filter = '';
    public $callbackPaging = 'goPage';
    public $skin = Pagination::SKIN_DEFAULT;  //skin1: pagination, skin2: pagination-nostyle

    public $hasFirstEndItem = true;

    //default is fontawsome
    public $text_first = '<i class="--bg-color fa fa-angle-double-left"></i>';
    public $text_last = '<i class="--bg-color fa fa-angle-double-right"></i>';
    public $text_next = '<i class="--bg-color fa fa-angle-right"></i>';
    public $text_prev = '<i class="--bg-color fa fa-angle-left"></i>';

    public function render($ajax = false)
    {
        if ($ajax) {
            return $this->ajaxRender();
        } else {
            return $this->basicRender();
        }
    }

    private function basicRender()
    {
        $total = $this->total;
        if ($this->page < 1) {
            $page = 1;
        } else {
            $page = $this->page;
        }

        if (!(int)$this->limit) {
            $limit = 10;
        } else {
            $limit = $this->limit;
        }

        $num_links = $this->num_links;
        $num_pages = ceil($total / $limit);

        $this->url = str_replace('%7Bpage%7D', '{page}', $this->url) . $this->filter;


        //$output = '<ul class="' . $this->skin . ' pagination-lg pagination-sm">';
        $output = '';

        if ($page > 1) {
            if ($this->hasFirstEndItem) {
                $output .= '<a class="page-number" href="' . str_replace('{page}', 1, $this->url) . '">' . $this->text_first . '</a>';
            }
            $output .= '<a class="page-number" href="' . str_replace('{page}', $page - 1, $this->url) . '">' . $this->text_prev . '</a>';
        }

        if ($num_pages > 1) {
            if ($num_pages <= $num_links) {
                $start = 1;
                $end = $num_pages;
            } else {
                $start = $page - floor($num_links / 2);
                $end = $page + floor($num_links / 2);

                if ($start < 1) {
                    $end += abs($start) + 1;
                    $start = 1;
                }

                if ($end > $num_pages) {
                    $start -= ($end - $num_pages);
                    $end = $num_pages;
                }
            }

            for ($i = $start; $i <= $end; $i++) {
                if ($page == $i) {
                    $output .= '<a class="page-number active">' . $i . '</a>';
                } else {
                    $output .= '<a class="page-number" href="' . str_replace('{page}', $i, $this->url) . '">' . $i . '</a>';
                }
            }
        }

        if ($page < $num_pages) {
            $output .= '<a class="page-number" href="' . str_replace('{page}', $page + 1, $this->url) . '">' . $this->text_next . '</a>';
            if ($this->hasFirstEndItem) {
                $output .= '<a class="page-number" href="' . str_replace('{page}', $num_pages, $this->url) . '">' . $this->text_last . '</a>';
            }
        }

        //$output .= '</ul>';

        if ($num_pages > 1) {
            return $output;
        } else {
            return '';
        }
    }

    private function ajaxRender()
    {
        $total = $this->total;

        if ($this->page < 1) {
            $page = 1;
        } else {
            $page = $this->page;
        }

        if (!(int)$this->limit) {
            $limit = 10;
        } else {
            $limit = $this->limit;
        }

        $num_links = $this->num_links;
        $num_pages = ceil($total / $limit);


        //$output = '<ul class="' . $this->skin . '">';
        $output = '';

        if ($page > 1) {
            if ($this->hasFirstEndItem) {
                $output .= '<a class="page-number" onclick="' . $this->callbackPaging . '(1,\'' . $this->filter . '\')" >' . $this->text_first . '</a>';
            }
            $output .= '<a class="page-number" onclick="' . $this->callbackPaging . '(' . ($page - 1) . ',\'' . $this->filter . '\')" >' . $this->text_prev . '</a>';
        }

        if ($num_pages > 1) {
            if ($num_pages <= $num_links) {
                $start = 1;
                $end = $num_pages;
            } else {
                $start = $page - floor($num_links / 2);
                $end = $page + floor($num_links / 2);

                if ($start < 1) {
                    $end += abs($start) + 1;
                    $start = 1;
                }

                if ($end > $num_pages) {
                    $start -= ($end - $num_pages);
                    $end = $num_pages;
                }
            }

            for ($i = $start; $i <= $end; $i++) {
                if ($page == $i) {
                    $output .= '<a class="page-number active">' . $i . '</a>';
                } else {
                    $output .= '<a class="page-number" onclick="' . $this->callbackPaging . '(' . $i . ',\'' . $this->filter . '\')">' . $i . '</a>';
                }
            }
        }

        if ($page < $num_pages) {
            $output .= '<a class="page-number" onclick="' . $this->callbackPaging . '(' . ($page + 1) . ',\'' . $this->filter . '\')">' . $this->text_next . '</a>';
            if ($this->hasFirstEndItem) {
                $output .= '<a class="page-number" onclick="' . $this->callbackPaging . '(' . $num_pages . ',\'' . $this->filter . '\')">' . $this->text_last . '</a>';
            }
        }

        //$output .= '</ul>';

        if ($num_pages > 1) {
            return $output;
        } else {
            return '';
        }
    }
}