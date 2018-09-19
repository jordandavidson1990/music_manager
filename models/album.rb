require("pg")
require_relative("../db/sql_runner")
# require_relative("../models/artist")

class Album

  attr_accessor :album_name, :genre, :artist_id
  attr_reader :id

  def initialize(options)
    @album_name = options["album_name"]
    @genre = options["genre"]
    @id = options["id"].to_i if options["id"]
    @artist_id = options["artist_id"].to_i
  end

  def save()
    sql = "INSERT INTO albums (album_name, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@album_name, @genre, @artist_id]
    album = SqlRunner.run(sql, values)
    @id = album[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM albums"
    album_hashes = SqlRunner.run(sql)
    album_objects = album_hashes.map{|album| Album.new(album)}
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    artist_hash = results[0]
    artist = Artist.new(artist_hash)
    return artist
  end

  def update()
    sql = "UPDATE albums SET (album_name, genre, artist_id)
    = ($1, $2, $3) WHERE id = $4"
    values = [@album_name, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # def self.find(id)
  #   sql = "SELECT * FROM albums WHERE id = $1"
  #   values = [id]
  #   results = SqlRunner.run(sql, values)
  #   albums_hash = results.first
  #   album = Album.new(albums_hash)
  #   return album
  # end

end
