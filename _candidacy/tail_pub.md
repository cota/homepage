---
<ul>
  <li> Title: <b>Computer Systems Research in the Post-Dennard Scaling Era</b></li>
  <li> Abstract:
The end of Dennard scaling has forced computer system architects
to turn their attention from performance to energy efficiency,
since the former is now determined by the latter.

Drawing from recent research, this talk discusses
the challenges of this new era and highlights recent work on
tackling them through greater degrees of parallelism and heterogeneity.
</li>
  <li> Slides: <a href="https://speakerdeck.com/cota/computer-systems-research-in-the-post-dennard-scaling-era">Speaker Deck</a>, <a href="pubs/candidacy.pdf">pdf</a>.
  <li> Committee: <a href="http://www.cs.columbia.edu/~luca/">Luca Carloni</a>, <a href="http://www.cs.columbia.edu/~nieh/">Jason Nieh</a>, <a href="http://www.cs.columbia.edu/~simha/">Simha Sethumadhavan</a>.</li>
  <li> Time and date: 1:30p-3:30p, Tuesday, April 30, 2013.</li>
  <li> Location: CSB 453 (CS Conference Room).</li>
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
      <b>{{ paper.title }}</b>{% if paper.url %}</a>{% endif %}
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
