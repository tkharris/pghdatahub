pghdatahub
==========

A hub for municipal Pittsburgh data


A. Install Solr

	1.  Find a machine - e.g. Ubuntu EC2 Instance (Micro), and open ports 22 and 8983
	2.	sudo useradd -d /home/search -m search
	3.	cd /tmp
	4.	wget http://psg.mtu.edu/pub/apache/lucene/solr/3.6.2/apache-solr-3.6.2.tgz
	5.	gunzip apache-solr-3.6.2.tgz
	6.	tar -xvf apache-solr-3.6.2.tgz
	7.	sudo mv /tmp/apache-solr-3.6.2 /home/search
	8.  customize Solr configuration
		- Paste the 2 conf files in the apache-solr-3.6.2 directory on top of the default install.

B. Install JAVA

	9.	sudo apt-get update
	10.	sudo apt-get install openjdk-6-jre-headless
		- If you have any problems with the install failing try again adding --fix-missing
	11. run solr by issuing the following command:
		java -Djetty.home=example -Djetty.logs=/tmp -Dsolr.solr.home=example/solr -jar example/start.jar  &

C. Import the Data

	11. Use the csv file in the data directory
	12. Run the import command below
		curl "http://localhost:8983/solr/update/csv?commit=true" --data-binary @/tmp/pghdata.csv -H "Content-Type:text/plain; charset=utf-8"
		curl "http://localhost:8983/solr/update?commit=true -H 'Content-Type:text/plain; charset=utf-8'"	

D. Solr Search Examples

	13. Full Text Search Example:
		http://localhost:8983/solr/select?wt=xml&q=planning
	14. Field Search (for specific docid):
		http://localhost:8983/solr/select?wt=xml&q=docid:21
	15. AutoComplete (for specific prefix; currently only looking at title fields; we can choose which fields we want to use):
		http://localhost:8983/solr/select?rows=0&q=*:*&facet=true&facet.field=name_auto&facet.mincount=1&facet.prefix=cit
