using Genie, Genie.Renderer.Html, Genie.Requests

# Create a new Genie app
Genie.Generator.newapp("app")

form = """
    <form action="/sum" method="POST">
        <label for="label1">Number 1: </label>
        <input type="text" id="num1" name="num1" placeholder="1st number"><br>
        <label for="label2">Number 2: </label>
        <input type="text" id="num2" name="num2" placeholder="2nd number"><br>
        <input type="submit" value="Submit">
    </form>
"""

# Define a route to handle GET requests for the home page
route("/") do
    html(form)
end

# Define a route to handle POST requests and compute the sum
route("/sum", method=POST) do
    num1 = parse(Float32, params(:num1))
    num2 = parse(Float32, params(:num2))
    sum = +(num1, num2)

    "The sum of $num1 and $num2 is $sum"
end

