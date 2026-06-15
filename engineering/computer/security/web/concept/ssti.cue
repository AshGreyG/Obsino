package concept

ssti: {
  content: #"""
    #let ssti-map-repo-url = "https://github.com/vladko312/SSTImap"

    SSTI (Server-Side Template Injection) occurs when user input is unsafely
    concatenated into a server-side template, and the template engine executes
    it as code rather than treating it as data.

    Useful tools:
    - #link(ssti-map-repo-url)[SSTImap]
  """#
  external_link: [
    "https://github.com/vladko312/SSTImap"
  ]
  related: [
    "specific/flask-ssti"
  ]
}