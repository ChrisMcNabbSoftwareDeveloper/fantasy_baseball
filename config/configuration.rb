require 'configuration'

Configuration.for('batting_input_file') {
  file_name 'data/Batting-07-12.csv'
}

Configuration.for('pitching_input_file') {
  file_name 'data/Pitching-07-12.csv'
}

Configuration.for('csv_options') {
  options 'headers: true'
}

Configuration.for('csv_options_2') {
options {
  col_sep ','
  row_sep 'auto'
  quote_char ""
  field_size_limit nil
  converters nil
  unconverted_fields nil
  headers true
  return_headers false
  write_headers false
  skip_blanks false
  force_quotes false
  encoding 'UTF-8'
  }
}

