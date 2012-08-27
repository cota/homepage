---
<h2>{{ page.title }} (<a href="pubs.rss">RSS</a>)</h2>
<ul>
{% for block in page.publications %}
  {% for paper in block.papers %}
  <li>
      <b>{{ paper.title }}.</b>
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
  {% endfor %}
{% endfor %}
</ul>
