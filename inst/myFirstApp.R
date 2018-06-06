# library(shiny)
# ui <- fluidPage()
# server <- function(input, output){}
# shinyApp(ui = ui, server = server)

######  Shiny Page Skeleton  ##################################################
library(shiny)

# Make the skeleton of an .html webpage. All of the instruction for making a
#   website are contained within the parenthesis. This is a bit of a pain.
ui <- fluidPage(

)

# This makes the skeleton of a "server" function.
server <- function(input, output, session) {

}

# This is the shiny control panel. Running this code starts the app.
shinyApp(ui, server)



######  Hello World  ##########################################################
library(shiny)

# Make the skeleton of an .html webpage. All of the instruction for making a
#   website are contained within the parenthesis. This is a bit of a pain.
ui <- fluidPage(
  "hello, world!"
)

# This makes the skeleton of a "server" function.
server <- function(input, output, session) {

}

# This is the shiny control panel. Running this code starts the app.
shinyApp(ui, server)



######  Adding a Header  ######################################################
library(shiny)

# Make the skeleton of an .html webpage. All of the instruction for making a
#   website are contained within the parenthesis. This is a bit of a pain.
ui <- fluidPage(
  h1("Hi mom!"),
  p("It's your firstborn."),

  # We can also add a slider. The inputID will be a variable name, but the
  #   label is the printed name of the slider.
  sliderInput(
    inputId = "amountOfAwesome",
    label = "Estimate Jay's Awesomeness",
    value = 11, min = 1, max = 11
  )
)

# This makes the skeleton of a "server" function.
server <- function(input, output, session) {

}

# This is the shiny control panel. Running this code starts the app.
shinyApp(ui, server)


# See https://shiny.rstudio.com/images/shiny-cheatsheet.pdf for more functions.
#   Syntax: <thing to do>Output("<name>"); e.g. plotOutput("hist")



######  Add Server Computing  #################################################
# Up to this point, our website hasn't done any computing. Let's add some
#   computing to the website. We do this with the server() function.

# Basically, the input object is a list with elements named by the "inputID"
#   fields in the ui function. See Ray's Slide 175 for an overview of the
#   mechanics. Programming shiny sites with "reactive()" is the most important
#   component.

library(shiny)

ui <- fluidPage(

  h1("Hi mom!"),
  p("It's your firstborn."),

  # We can also add a slider. The inputID will be a variable name, but the
  #   label is the printed name of the slider.
  sliderInput(
    inputId = "amountOfAwesome",
    label = "Estimate Jay's Awesomeness",
    value = 11, min = 1, max = 11
  ),

  textOutput("awesomeness"),

  br(),

  radioButtons(inputId = "amountOfMania",
               label = "Categorical Estimate of Jay's stability",
               choices = c("Sleeping" = "0",
                           "Serious" = "1",
                           "Somewhat silly" = "2",
                           "Very silly"= "3",
                           "Kinda-Manic" = "4",
                           "Oh that is not good" = "5")),

  textOutput("amountOfMania")


  # END ui
)

server <- function(input, output, session) {

  output$awesomeness <- renderText({

    paste("On the scale from 1 to 10, Jay's awesomeness is at an",
          input$amountOfAwesome)

    })

  score <- reactive(
    as.numeric(input$amountOfMania) * 20
  )
  output$amountOfMania <- renderText({
    paste("On a scale from 0 to 100 Jay's mania is about:", score())
  })


  output
  # END server
}

shinyApp(ui, server)

