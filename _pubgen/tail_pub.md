---
<h1>Emilio G. Cota</h1>

<img ALIGN="left" width="303" height="200" hspace="75" src="images/cota0.jpg" alt="Emilio picture">
<ul>
<li><a href="http://www.cs.columbia.edu/~cota">Emilio G. Cota</a></li>
<a href="http://sld.cs.columbia.edu/">SLD Group</a>, <a href="http://www.cs.columbia.edu/">Computer Science Department</a>, <a href="http://www.columbia.edu/">Columbia University</a></li>
<li>467 Computer Science Building,
<br />
1214 Amsterdam Avenue
<br />
New York, NY 10027
</li>
<li><span class="oppdir">ude.aibmuloc.sc@atoc</span></li>
</ul>
<br />
<hr />
<h2>Publications (<a href="pubs.rss">RSS</a>)</h2>
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
      {% if paper.slides %}
      <b> [<a href="pubs/{{ paper.slides }}">slides</a>]</b>
      {% endif %}
      {% if paper.slides-pdf %}
      <b> [<a href="pubs/{{ paper.slides-pdf }}">pdf slides</a>]</b>
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
</ul>

<h2>Talks</h2>
<ul>
   <li><a href="candidacy.html">PhD Candidacy Exam</a></li>
</ul>

<h2>TAing</h2>
<ul>
<li>Fall 2012: <a href="http://www.cs.columbia.edu/~cs4824/">CSEE4824 Computer Architecture</a></li>
<li>Fall 2011: <a href="http://www.cs.columbia.edu/~cs4824/">CSEE4824 Computer Architecture</a></li>
</ul>

<h2>etc.</h2>
<ul>
<li><a href="http://braap.org/docs/cota-resume.pdf">My resume</a></li>
<li><a href="https://github.com/cota">Some code</a> on github. Unfortunately not much of what I write these days is there.</li>
<li><a href="http://www.ohwr.org/projects/white-rabbit/wiki">White Rabbit</a>,
a deterministic network for sub-nanosecond synchronisation which I contributed
to while at <a href="http://cern.ch/">CERN</a> (a <a href="images/dilbert.gif">peculiar place.</a>)
</li>
</ul>
