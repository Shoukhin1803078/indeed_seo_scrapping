# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


# useful for handling different item types with a single interface
# from itemadapter import ItemAdapter


# class AirregiScraperPipeline:
#     def process_item(self, item, spider):
#         return item



import pandas as pd
import os

class CsvProcessingPipeline:

    def process_item(self, item, spider):
        file_path = item.get("file_path")

        if not file_path or not os.path.exists(file_path):
            spider.logger.error("CSV file not found")
            return item

        spider.logger.info("Processing CSV with pandas...")

        df = pd.read_csv(file_path)
        spider.logger.info(f"Head: {df.head()}")
        spider.logger.info(f"Total Columns: {len(df.columns)}")
        spider.logger.info(f"Total rows: {len(df)}")

        spider.logger.info(f"--------------------------------Finished processing--------------------------------")

        return item