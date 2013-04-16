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

<h2>TAing</h2>
<p>Fall 2012: <a href="http://www.cs.columbia.edu/~cs4824/">CSEE4824 Computer Architecture</a></p>

<h2>etc.</h2>
<ul>
<li><a href="https://github.com/cota">Some code</a> on github. Unfortunately not much of what I write these days is there.</li>
<li><a href="http://www.ohwr.org/projects/white-rabbit/wiki">White Rabbit</a>,
a deterministic network for sub-nanosecond synchronisation which I contributed
to while at <a href="http://cern.ch/">CERN</a> (a <a href="images/dilbert.gif">peculiar place.</a>)
</li>
</ul>
