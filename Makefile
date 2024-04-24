
#! add a rule for rendering the combined report

final_report.html: code/04_render_report.R output/data.rds output/table_one.rds output/figure.png
	echo "running final report" && code/04_render_report.R && mv report.html report

#! add a rule for building the output of 
#! code/00_make_dataset.R

output/data.rds: code/00_make_dataset.R
	echo "making data set" && Rscript code/00_make_dataset.R

#! add a rule for building the output of 
#! code/01_make_table.R

output/table_one.rds: code/01_make_table.R
	Rscript code/01_make_table.R

#! add a rule for building the output of 
#! code/02_make_figure.R
output/figure.png: code/02_make_figure.R
	Rscript code/02_make_figure.R
	
# PHONY target for removing output files
.PHONY: clean
clean:
	rm -rf output/* final_report.html Rplots.pdf README.html
	
#! add a rule for installing project packages
install:
    Rscript -e 'renv::restore()'
    
#! add a rule for building Docker image
build:
	docker build -t final_project .

#! run Docker container to generate the report
#! mount the local 'report' directory to the container's '/project/output' directory
run:
	docker run -v "$$(pwd)/report:/project/report" alexklimek1/final_project

