package specific

flask_ssti: {
  content: """
    #let flask-repo-url = "https://github.com/pallets/flask"
    #let jinja-repo-url = "https://github.com/pallets/jinja"
    #let render-template = "https://github.com/pallets/flask/blob/36e4a824f340fdee7ed50937ba8e7f6bc7d17f81/src/flask/templating.py#L136"
    #let render-template-string = "https://github.com/pallets/flask/blob/36e4a824f340fdee7ed50937ba8e7f6bc7d17f81/src/flask/templating.py#L151"

    #link(flask-repo-url)[Flask] uses #link(jinja-repo-url)[Jinja2] as its
    template engine. There are two rendering methods:

    #align(center)[
      #table(
        columns: 3,
        [Function], [Usage], [Security],

        [#link(render-template)[`render_template("file.html", var=data)`]],
        [Renders a template file],
        [✅ Safe],

        [#link(render-template-string)[`render_template_string(string)`]],
        [Renders a string as a template],
        [⚠️ Dangerous if string contains user input]
      )
    ]

    Vulnerable code example:

    \(code_part_docker_example)

    If we visit `/greet?name={{7*7}}`, the server returns `49` instead of `{{7*7}}`.
    This confirms SSTI exists. Once SSTI is confirmed, an attacker can escalate
    to Remote Code Execution (RCE).

    1. Step 1: Access configuration

      \(code_part_jinja2_config)

    2. Step 2: Traverse Python object hierarchy

    Jinja2 can access python internal attributes:

    #align(center)[
      #table(
        columns: 2,
        align: (left, left),
        [Attribute], [Purpose],

        [`__class__`], [Returns the object's class],
        [`__bases__`], [Returns parent classes],
        [`__mro__`], [Method resolution order],
        [`__subclasses__()`], [Returns all subclasses of a class],
        [`__globals__`], [Returns global variables of a function]
      )
    ]

    \(code_part_jinja2_object_base)

    List all subclasses:

    \(code_part_jinja2_list_subclasses)

    This returns a long list, attackers look for dangerous classes like:
    - `<class 'subprocess.Popen'>`
    - `<class 'os._wrap_close'>`
    - `<class 'warnings.catch_warnings'>`

    All can be used to access `*.__init__.__globals__["os"]`

    We need to find the indexes of these dangerous classes:

    \(code_part_find)

    3. Step 3: Execute system commands

    \(code_part_jinja2_subprocess_popen)
  """
  code_part_docker_example: #"""
    #let docker = "assets/docker/flask-ssti/app.py"
    #raw-block-file(docker, "python")
  """#
  code_part_jinja2_config: #"""
    #let jinja2-config = "src/flask-ssti/config.jinja2"
    #raw-block-file(jinja2-config, "jinja2")
  """#
  code_part_jinja2_object_base: #"""
    #let jinja2-object-base = "src/flask-ssti/object-base.jinja2"
    #raw-block-file(jinja2-object-base, "jinja2")
  """#
  code_part_jinja2_list_subclasses: #"""
    #let jinja2-list-subclasses = "src/flask-ssti/list-subclasses.jinja2"
    #raw-block-file(jinja2-list-subclasses, "jinja2")
  """#
  code_part_jinja2_subprocess_popen: #"""
    #let jinja2-subprocess-popen = "src/flask-ssti/subprocess-popen.jinja2"
    #raw-block-file(jinja2-subprocess-popen, "jinja2")
  """#
  code_part_find: #"""
    #let find-dangerous-classes = "src/flask-ssti/find.py"
    #raw-block-file(find-dangerous-classes, "python")
  """#
  external_link: [
    "https://github.com/pallets/flask",
    "https://github.com/pallets/jinja",
    "https://github.com/pallets/flask/blob/36e4a824f340fdee7ed50937ba8e7f6bc7d17f81/src/flask/templating.py#L136",
    "https://github.com/pallets/flask/blob/36e4a824f340fdee7ed50937ba8e7f6bc7d17f81/src/flask/templating.py#L151"
  ]
  related: [
    "concept/ssti"
  ]
}