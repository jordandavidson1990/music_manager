require('pg')
require_relative('../db/sql_runner')

class Artist

  attr_accessor :artist_name
  attr_reader :id

  def initialize(options)
    @artist_name = options['artist_name']
    @id = options['id'].to_i if options ['id']
  end

  def save()
    sql = "INSERT INTO artists (
    artist_name) VALUES ($1) RETURNING id"
    values = [@artist_name]
    artist = SqlRunner.run(sql, values)
    @id = artist[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artist_hashes = SqlRunner.run(sql)
    artist_objects = artist_hashes.map{|artist| Artist.new(artist)}
  end

  def albums
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id] #meaning the ID of the artist
    artist_albums = SqlRunner.run(sql, values)
    return artist_albums.map{|album_hash| Album.new(album_hash)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i  # database object saved/held here
    result_hash = result[0]  # converted here from database object to a ruby object
    return Artist.new(result_hash)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end
end
