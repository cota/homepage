---
<h1>{{ page.title }} -- Title TBD</h1>
<ul>
  <li> Committee: TBA</li>
  <li> Time and Date: TBD</li>
  <li> Location: TBD</li>
</ul>

<h1>Syllabus</h1>
<ol>
{% for block in page.publications %}
  <h2>{{ block.level_1 }}</h2>
  {% for paper in block.papers %}
  <li>
      [<span style="font-variant: small-caps">{{ paper.author_date }}</span>]
      {% if paper.url %}
      <a href="{{ paper.url }}">
      {% endif %}
      <b>{{ paper.title }}.</b>
      {% if paper.url %}
      </a>
      {% endif %}
      {% if paper.pdf %}
      <b> [<a href="pubs/{{ paper.pdf }}">pdf</a>]</b>
      {% endif %}
      {% if paper.ps %}
      <b> [<a href="pubs/{{ paper.ps }}">ps</a>]</b>
      {% endif %}
      {% if paper.ps.gz %}
      <b> [<a href="pubs/{{ paper.ps.gz }}">ps.gz</a>]</b>
      {% endif %}
      {% if paper.html %}
      <b> [<a href="pubs/{{ paper.html }}">html</a>]</b>
      {% endif %}
      {% if paper.txt %}
      <b> [<a href="pubs/{{ paper.txt }}">txt</a>]</b>
      {% endif %}
      {% if paper.ppt %}
      <b> [<a href="pubs/{{ paper.ppt }}">ppt</a>]</b>
      {% endif %}
      {% if paper.odt %}
      <b> [<a href="pubs/{{ paper.odt }}">odt</a>]</b>
      {% endif %}

      {% if paper.note %}
      <b><font color="#aa0000"> {{ paper.note }}</font></b>
      {% endif %}
      <br />
      by {{ paper.authors }}.<br />
      {{ paper.venue }}, {{ paper.details }}.
      {% if paper.bib %}
      [<a href="bibs/{{ paper.bib }}">BibTeX entry</a>]
      {% endif %}
  </li>
  <br />
  {% endfor %}
{% endfor %}
</ol>
