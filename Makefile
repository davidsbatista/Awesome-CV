.PHONY: examples cv clean

CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = examples/cv
MYCV_DIR = dsbatista
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
MYCV_SRCS = $(shell find $(MYCV_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume, $(EXAMPLES_DIR)/$x.pdf)

# Build the personal CV only: `make cv`
cv: $(MYCV_DIR)/cv.pdf

$(MYCV_DIR)/cv.pdf: $(MYCV_SRCS)
	TEXINPUTS="$(MYCV_DIR):$$TEXINPUTS" \
	  $(CC) -output-directory=$(MYCV_DIR) $(MYCV_DIR)/cv.tex

$(EXAMPLES_DIR)/resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

$(EXAMPLES_DIR)/cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

$(EXAMPLES_DIR)/coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf $(MYCV_DIR)/*.pdf
