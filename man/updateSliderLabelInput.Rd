% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/input-sliderLabel.R
\name{updateSliderLabelInput}
\alias{updateSliderLabelInput}
\title{Change the value of a slider label input on the client}
\usage{
updateSliderLabelInput(session, inputId, label = NULL, selected = NULL,
  choices = NULL, from_fixed = NULL, to_fixed = NULL)
}
\arguments{
\item{session}{The session object passed to function given to shinyServer.}

\item{inputId}{The id of the input object.}

\item{label}{The label to set.}

\item{selected}{The values selected.}

\item{choices}{The new choices for the input.}

\item{from_fixed}{Fix the left handle (or single handle).}

\item{to_fixed}{Fix the right handle.}
}
\description{
Change the value of a slider label input on the client
}
\examples{
\dontrun{

if (interactive()) {
library("shiny")
library("shinyWidgets")

my_choices = 1:12
names(my_choices) = month.name

ui <- fluidPage(
  br(),
  sliderLabelInput(
    inputId = "mySlider",
    label = "Pick a month :",
    choices = my_choices,
    selected = my_choices[1]
  ),
  verbatimTextOutput(outputId = "res"),
  radioButtons(
    inputId = "up",
    label = "Update choices:",
    choices = c("Abbreviations", "Full names")
  )
)

server <- function(input, output, session) {
  output$res <- renderPrint(str(input$mySlider))

  observeEvent(input$up, {

    choices <- switch(
      input$up,
      "Abbreviations" = setNames(1:12,month.abb),
      "Full names" = setNames(1:12,month.name)
    )
    updateSliderLabelInput(
      session = session,
      inputId = "mySlider",
      choices = choices
    )
  }, ignoreInit = TRUE)
}

shinyApp(ui = ui, server = server)
}

}
}
\seealso{
\code{\link{sliderTextInput}}
}
